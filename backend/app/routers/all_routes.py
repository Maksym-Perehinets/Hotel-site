from fastapi import APIRouter
from . import home_page


def get_apps_router():
    """
    Place where all routes are defined into one route that latter imported
    """
    router = APIRouter()
    router.include_router(home_page.router)
    return router
